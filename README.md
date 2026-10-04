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
Updated: 2026-10-04T12:59:27.960477+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.969 |  |
| ap-east-1 | 0.705 |  |
| ap-east-2 | 0.644 |  |
| ap-northeast-1 | 0.527 |  |
| ap-northeast-2 | 0.628 |  |
| ap-northeast-3 | 0.552 |  |
| ap-south-1 | 0.882 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.813 |  |
| ap-southeast-2 | 0.677 |  |
| ap-southeast-3 | 0.839 |  |
| ap-southeast-4 | 0.729 |  |
| ap-southeast-5 | 0.804 |  |
| ap-southeast-6 | 0.735 |  |
| ap-southeast-7 | 0.890 |  |
| ca-central-1 | 0.196 | 18 |
| ca-west-1 | 0.250 |  |
| eu-central-1 | 0.474 |  |
| eu-central-2 | 0.492 |  |
| eu-north-1 | 0.525 |  |
| eu-south-1 | 0.510 |  |
| eu-south-2 | 0.486 |  |
| eu-west-1 | 0.400 |  |
| eu-west-2 | 0.433 |  |
| eu-west-3 | 0.456 |  |
| il-central-1 | 0.637 |  |
| me-central-1 | 0.875 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.218 |  |
| sa-east-1 | 0.591 |  |
| us-east-1 | 0.150 | 5137 |
| us-east-2 | 0.174 | 1690 |
| us-gov-east-1 | 0.173 | 1932 |
| us-gov-west-1 | 0.216 | 237 |
| us-west-1 | 0.158 | 4155 |
| us-west-2 | 0.215 | 192 |

