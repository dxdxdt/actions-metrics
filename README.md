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
Updated: 2026-03-09T21:26:07.391121+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.955 |  |
| ap-east-1 | 0.746 |  |
| ap-east-2 | 0.696 |  |
| ap-northeast-1 | 0.566 |  |
| ap-northeast-2 | 0.672 |  |
| ap-northeast-3 | 0.595 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.830 |  |
| ap-southeast-2 | 0.730 |  |
| ap-southeast-3 | 0.886 |  |
| ap-southeast-4 | 0.775 |  |
| ap-southeast-5 | 0.831 |  |
| ap-southeast-6 | 0.774 |  |
| ap-southeast-7 | 0.934 |  |
| ca-central-1 | 0.178 | 16 |
| ca-west-1 | 0.235 |  |
| eu-central-1 | 0.465 |  |
| eu-central-2 | 0.485 |  |
| eu-north-1 | 0.517 |  |
| eu-south-1 | 0.486 |  |
| eu-south-2 | 0.502 |  |
| eu-west-1 | 0.388 |  |
| eu-west-2 | 0.422 |  |
| eu-west-3 | 0.440 |  |
| il-central-1 | 0.647 |  |
| me-central-1 | 0.839 |  |
| me-south-1 | 0.802 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.562 |  |
| us-east-1 | 0.130 | 4250 |
| us-east-2 | 0.139 | 1412 |
| us-gov-east-1 | 0.147 | 1549 |
| us-gov-west-1 | 0.245 | 176 |
| us-west-1 | 0.196 | 3204 |
| us-west-2 | 0.243 | 144 |

