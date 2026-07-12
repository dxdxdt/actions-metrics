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
Updated: 2026-07-12T13:01:04.605372+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.905 |  |
| ap-east-1 | 0.783 |  |
| ap-east-2 | 0.722 |  |
| ap-northeast-1 | 0.607 |  |
| ap-northeast-2 | 0.708 |  |
| ap-northeast-3 | 0.631 |  |
| ap-south-1 | 0.847 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.859 |  |
| ap-southeast-2 | 0.758 |  |
| ap-southeast-3 | 0.906 |  |
| ap-southeast-4 | 0.804 |  |
| ap-southeast-5 | 0.877 |  |
| ap-southeast-6 | 0.787 |  |
| ap-southeast-7 | 0.962 |  |
| ca-central-1 | 0.132 | 16 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.418 |  |
| eu-central-2 | 0.438 |  |
| eu-north-1 | 0.464 |  |
| eu-south-1 | 0.453 |  |
| eu-south-2 | 0.456 |  |
| eu-west-1 | 0.341 |  |
| eu-west-2 | 0.378 |  |
| eu-west-3 | 0.402 |  |
| il-central-1 | 0.597 |  |
| me-central-1 | 0.812 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.528 |  |
| us-east-1 | 0.084 | 4855 |
| us-east-2 | 0.101 | 1656 |
| us-gov-east-1 | 0.102 | 1740 |
| us-gov-west-1 | 0.274 | 202 |
| us-west-1 | 0.219 | 3771 |
| us-west-2 | 0.274 | 165 |

