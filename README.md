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
Updated: 2026-03-01T05:46:26.279766+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.058 |  |
| ap-east-1 | 0.643 |  |
| ap-east-2 | 0.577 |  |
| ap-northeast-1 | 0.463 |  |
| ap-northeast-2 | 0.561 |  |
| ap-northeast-3 | 0.481 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.876 |  |
| ap-southeast-1 | 0.714 |  |
| ap-southeast-2 | 0.604 |  |
| ap-southeast-3 | 0.766 |  |
| ap-southeast-4 | 0.643 |  |
| ap-southeast-5 | 0.737 |  |
| ap-southeast-6 | 0.665 |  |
| ap-southeast-7 | 0.821 |  |
| ca-central-1 | 0.284 | 16 |
| ca-west-1 | 0.188 |  |
| eu-central-1 | 0.570 |  |
| eu-central-2 | 0.593 |  |
| eu-north-1 | 0.620 |  |
| eu-south-1 | 0.595 |  |
| eu-south-2 | 0.601 |  |
| eu-west-1 | 0.486 |  |
| eu-west-2 | 0.532 |  |
| eu-west-3 | 0.547 |  |
| il-central-1 | 0.750 |  |
| me-central-1 | 0.941 |  |
| me-south-1 | 0.901 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.669 |  |
| us-east-1 | 0.239 | 4201 |
| us-east-2 | 0.216 | 1386 |
| us-gov-east-1 | 0.215 | 1519 |
| us-gov-west-1 | 0.132 | 166 |
| us-west-1 | 0.081 | 3146 |
| us-west-2 | 0.137 | 134 |

