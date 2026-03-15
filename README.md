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
Updated: 2026-03-15T10:23:07.193374+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.885 |  |
| ap-east-1 | 0.782 |  |
| ap-east-2 | 0.722 |  |
| ap-northeast-1 | 0.601 |  |
| ap-northeast-2 | 0.718 |  |
| ap-northeast-3 | 0.628 |  |
| ap-south-1 | 0.849 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.865 |  |
| ap-southeast-2 | 0.764 |  |
| ap-southeast-3 | 0.926 |  |
| ap-southeast-4 | 0.804 |  |
| ap-southeast-5 | 0.885 |  |
| ap-southeast-6 | 0.802 |  |
| ap-southeast-7 | 0.962 |  |
| ca-central-1 | 0.121 | 16 |
| ca-west-1 | 0.273 |  |
| eu-central-1 | 0.395 |  |
| eu-central-2 | 0.415 |  |
| eu-north-1 | 0.451 |  |
| eu-south-1 | 0.431 |  |
| eu-south-2 | 0.436 |  |
| eu-west-1 | 0.323 |  |
| eu-west-2 | 0.359 |  |
| eu-west-3 | 0.377 |  |
| il-central-1 | 0.583 |  |
| me-central-1 | 0.795 |  |
| me-south-1 | 0.747 |  |
| mx-central-1 | 0.272 |  |
| sa-east-1 | 0.500 |  |
| us-east-1 | 0.073 | 4282 |
| us-east-2 | 0.100 | 1424 |
| us-gov-east-1 | 0.100 | 1577 |
| us-gov-west-1 | 0.287 | 185 |
| us-west-1 | 0.241 | 3234 |
| us-west-2 | 0.287 | 147 |

