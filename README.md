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
Updated: 2026-07-01T14:14:12.445240+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.992 |  |
| ap-east-1 | 0.683 |  |
| ap-east-2 | 0.621 |  |
| ap-northeast-1 | 0.506 |  |
| ap-northeast-2 | 0.611 |  |
| ap-northeast-3 | 0.529 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.870 |  |
| ap-southeast-1 | 0.760 |  |
| ap-southeast-2 | 0.689 |  |
| ap-southeast-3 | 0.815 |  |
| ap-southeast-4 | 0.734 |  |
| ap-southeast-5 | 0.778 |  |
| ap-southeast-6 | 0.710 |  |
| ap-southeast-7 | 0.861 |  |
| ca-central-1 | 0.214 | 16 |
| ca-west-1 | 0.175 |  |
| eu-central-1 | 0.516 |  |
| eu-central-2 | 0.531 |  |
| eu-north-1 | 0.555 |  |
| eu-south-1 | 0.544 |  |
| eu-south-2 | 0.549 |  |
| eu-west-1 | 0.429 |  |
| eu-west-2 | 0.473 |  |
| eu-west-3 | 0.497 |  |
| il-central-1 | 0.670 |  |
| me-central-1 | 0.917 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.257 |  |
| sa-east-1 | 0.627 |  |
| us-east-1 | 0.179 | 4807 |
| us-east-2 | 0.155 | 1649 |
| us-gov-east-1 | 0.158 | 1727 |
| us-gov-west-1 | 0.176 | 200 |
| us-west-1 | 0.163 | 3724 |
| us-west-2 | 0.173 | 164 |

