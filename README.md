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
Updated: 2026-05-13T09:37:45.976903+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.954 |  |
| ap-east-1 | 0.762 |  |
| ap-east-2 | 0.694 |  |
| ap-northeast-1 | 0.580 |  |
| ap-northeast-2 | 0.668 |  |
| ap-northeast-3 | 0.593 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.874 |  |
| ap-southeast-1 | 0.828 |  |
| ap-southeast-2 | 0.715 |  |
| ap-southeast-3 | 0.883 |  |
| ap-southeast-4 | 0.767 |  |
| ap-southeast-5 | 0.843 |  |
| ap-southeast-6 | 0.806 |  |
| ap-southeast-7 | 0.943 |  |
| ca-central-1 | 0.175 | 16 |
| ca-west-1 | 0.251 |  |
| eu-central-1 | 0.473 |  |
| eu-central-2 | 0.494 |  |
| eu-north-1 | 0.522 |  |
| eu-south-1 | 0.496 |  |
| eu-south-2 | 0.501 |  |
| eu-west-1 | 0.394 |  |
| eu-west-2 | 0.428 |  |
| eu-west-3 | 0.444 |  |
| il-central-1 | 0.649 |  |
| me-central-1 | 0.849 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.583 |  |
| us-east-1 | 0.132 | 4631 |
| us-east-2 | 0.128 | 1591 |
| us-gov-east-1 | 0.149 | 1687 |
| us-gov-west-1 | 0.235 | 195 |
| us-west-1 | 0.182 | 3558 |
| us-west-2 | 0.235 | 158 |

