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
Updated: 2026-02-16T23:22:23.950767+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.899 |  |
| ap-east-1 | 0.788 |  |
| ap-east-2 | 0.714 |  |
| ap-northeast-1 | 0.609 |  |
| ap-northeast-2 | 0.746 |  |
| ap-south-1 | 0.857 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.865 |  |
| ap-southeast-2 | 0.792 |  |
| ap-southeast-3 | 0.918 |  |
| ap-southeast-4 | 0.840 |  |
| ap-southeast-5 | 0.889 |  |
| ap-southeast-6 | 0.850 |  |
| ap-southeast-7 | 0.976 |  |
| ca-central-1 | 0.129 | 16 |
| ca-west-1 | 0.278 |  |
| eu-central-1 | 0.400 |  |
| eu-central-2 | 0.425 |  |
| eu-north-1 | 0.462 |  |
| eu-south-1 | 0.436 |  |
| eu-south-2 | 0.436 |  |
| eu-west-1 | 0.335 |  |
| eu-west-2 | 0.368 |  |
| eu-west-3 | 0.383 |  |
| il-central-1 | 0.580 |  |
| me-central-1 | 0.789 |  |
| me-south-1 | 0.746 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.505 |  |
| us-east-1 | 0.076 | 4134 |
| us-east-2 | 0.113 | 1348 |
| us-gov-east-1 | 0.105 | 1481 |
| us-gov-west-1 | 0.319 | 150 |
| us-west-1 | 0.269 | 3066 |
| us-west-2 | 0.322 | 126 |

