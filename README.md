# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-08-17T06:37:15.193942+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.012 |  |
| ap-east-1 | 0.673 |  |
| ap-east-2 | 0.612 |  |
| ap-northeast-1 | 0.497 |  |
| ap-northeast-2 | 0.605 |  |
| ap-northeast-3 | 0.521 |  |
| ap-south-1 | 0.876 |  |
| ap-south-2 | 0.908 |  |
| ap-southeast-1 | 0.749 |  |
| ap-southeast-2 | 0.679 |  |
| ap-southeast-3 | 0.808 |  |
| ap-southeast-4 | 0.720 |  |
| ap-southeast-5 | 0.769 |  |
| ap-southeast-6 | 0.703 |  |
| ap-southeast-7 | 0.852 |  |
| ca-central-1 | 0.236 | 18 |
| ca-west-1 | 0.191 |  |
| eu-central-1 | 0.512 |  |
| eu-central-2 | 0.537 |  |
| eu-north-1 | 0.565 |  |
| eu-south-1 | 0.540 |  |
| eu-south-2 | 0.550 |  |
| eu-west-1 | 0.432 |  |
| eu-west-2 | 0.469 |  |
| eu-west-3 | 0.495 |  |
| il-central-1 | 0.670 |  |
| me-central-1 | 0.889 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.635 |  |
| us-east-1 | 0.189 | 5011 |
| us-east-2 | 0.200 | 1680 |
| us-gov-east-1 | 0.186 | 1835 |
| us-gov-west-1 | 0.165 | 224 |
| us-west-1 | 0.163 | 3973 |
| us-west-2 | 0.164 | 181 |

