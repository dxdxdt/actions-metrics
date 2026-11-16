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
Updated: 2026-11-16T07:29:58.287733+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.746 |  |
| ap-east-1 | 0.538 |  |
| ap-east-2 | 0.491 |  |
| ap-northeast-1 | 0.449 |  |
| ap-northeast-2 | 0.477 |  |
| ap-northeast-3 | 0.420 |  |
| ap-south-1 | 0.676 |  |
| ap-south-2 | 0.728 |  |
| ap-southeast-1 | 0.597 |  |
| ap-southeast-2 | 0.510 |  |
| ap-southeast-3 | 0.634 |  |
| ap-southeast-4 | 0.577 |  |
| ap-southeast-5 | 0.607 |  |
| ap-southeast-6 | 0.537 |  |
| ap-southeast-7 | 0.671 |  |
| ca-central-1 | 0.137 | 18 |
| ca-west-1 | 0.151 |  |
| eu-central-1 | 0.373 |  |
| eu-central-2 | 0.383 |  |
| eu-north-1 | 0.407 |  |
| eu-south-1 | 0.380 |  |
| eu-south-2 | 0.392 |  |
| eu-west-1 | 0.317 |  |
| eu-west-2 | 0.345 |  |
| eu-west-3 | 0.357 |  |
| il-central-1 | 0.475 |  |
| me-central-1 | 0.628 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.666 |  |
| mx-central-1 | 0.159 |  |
| sa-east-1 | 0.465 |  |
| us-east-1 | 0.115 | 5186 |
| us-east-2 | 0.093 | 1729 |
| us-gov-east-1 | 0.108 | 1962 |
| us-gov-west-1 | 0.157 | 247 |
| us-west-1 | 0.108 | 4218 |
| us-west-2 | 0.154 | 197 |

