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
Updated: 2026-08-09T04:57:13.574564+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.982 |  |
| ap-east-1 | 0.700 |  |
| ap-east-2 | 0.639 |  |
| ap-northeast-1 | 0.521 |  |
| ap-northeast-2 | 0.625 |  |
| ap-northeast-3 | 0.548 |  |
| ap-south-1 | 0.874 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.774 |  |
| ap-southeast-2 | 0.685 |  |
| ap-southeast-3 | 0.831 |  |
| ap-southeast-4 | 0.726 |  |
| ap-southeast-5 | 0.795 |  |
| ap-southeast-6 | 0.714 |  |
| ap-southeast-7 | 0.879 |  |
| ca-central-1 | 0.195 | 18 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.494 |  |
| eu-central-2 | 0.511 |  |
| eu-north-1 | 0.530 |  |
| eu-south-1 | 0.517 |  |
| eu-south-2 | 0.531 |  |
| eu-west-1 | 0.418 |  |
| eu-west-2 | 0.443 |  |
| eu-west-3 | 0.472 |  |
| il-central-1 | 0.651 |  |
| me-central-1 | 0.877 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.623 |  |
| us-east-1 | 0.161 | 4958 |
| us-east-2 | 0.165 | 1677 |
| us-gov-east-1 | 0.141 | 1810 |
| us-gov-west-1 | 0.190 | 214 |
| us-west-1 | 0.159 | 3908 |
| us-west-2 | 0.192 | 175 |

