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
Updated: 2026-03-10T01:16:43.038159+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.976 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.674 |  |
| ap-northeast-1 | 0.551 |  |
| ap-northeast-2 | 0.655 |  |
| ap-northeast-3 | 0.578 |  |
| ap-south-1 | 0.896 |  |
| ap-south-2 | 0.916 |  |
| ap-southeast-1 | 0.807 |  |
| ap-southeast-2 | 0.719 |  |
| ap-southeast-3 | 0.864 |  |
| ap-southeast-4 | 0.758 |  |
| ap-southeast-5 | 0.837 |  |
| ap-southeast-6 | 0.791 |  |
| ap-southeast-7 | 0.911 |  |
| ca-central-1 | 0.152 | 16 |
| ca-west-1 | 0.222 |  |
| eu-central-1 | 0.465 |  |
| eu-central-2 | 0.489 |  |
| eu-north-1 | 0.521 |  |
| eu-south-1 | 0.490 |  |
| eu-south-2 | 0.507 |  |
| eu-west-1 | 0.391 |  |
| eu-west-2 | 0.428 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.638 |  |
| me-central-1 | 0.840 |  |
| me-south-1 | 0.804 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.561 |  |
| us-east-1 | 0.117 | 4251 |
| us-east-2 | 0.114 | 1413 |
| us-gov-east-1 | 0.113 | 1549 |
| us-gov-west-1 | 0.227 | 176 |
| us-west-1 | 0.202 | 3205 |
| us-west-2 | 0.217 | 144 |

