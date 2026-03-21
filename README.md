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
Updated: 2026-03-21T05:06:35.071557+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.035 |  |
| ap-east-1 | 0.657 |  |
| ap-east-2 | 0.600 |  |
| ap-northeast-1 | 0.479 |  |
| ap-northeast-2 | 0.589 |  |
| ap-northeast-3 | 0.505 |  |
| ap-south-1 | 0.924 |  |
| ap-south-2 | 0.937 |  |
| ap-southeast-1 | 0.733 |  |
| ap-southeast-2 | 0.635 |  |
| ap-southeast-3 | 0.790 |  |
| ap-southeast-4 | 0.673 |  |
| ap-southeast-5 | 0.754 |  |
| ap-southeast-6 | 0.670 |  |
| ap-southeast-7 | 0.839 |  |
| ca-central-1 | 0.245 | 16 |
| ca-west-1 | 0.223 |  |
| eu-central-1 | 0.545 |  |
| eu-central-2 | 0.571 |  |
| eu-north-1 | 0.589 |  |
| eu-south-1 | 0.563 |  |
| eu-south-2 | 0.571 |  |
| eu-west-1 | 0.451 |  |
| eu-west-2 | 0.502 |  |
| eu-west-3 | 0.521 |  |
| il-central-1 | 0.720 |  |
| me-central-1 | 0.909 |  |
| me-south-1 | 0.865 |  |
| mx-central-1 | 0.205 |  |
| sa-east-1 | 0.655 |  |
| us-east-1 | 0.216 | 4318 |
| us-east-2 | 0.183 | 1443 |
| us-gov-east-1 | 0.182 | 1591 |
| us-gov-west-1 | 0.141 | 189 |
| us-west-1 | 0.125 | 3271 |
| us-west-2 | 0.141 | 149 |

