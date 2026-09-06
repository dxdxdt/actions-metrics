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
Updated: 2026-09-06T22:42:56.952393+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.927 |  |
| ap-east-1 | 0.754 |  |
| ap-east-2 | 0.690 |  |
| ap-northeast-1 | 0.573 |  |
| ap-northeast-2 | 0.677 |  |
| ap-northeast-3 | 0.598 |  |
| ap-south-1 | 0.852 |  |
| ap-south-2 | 0.886 |  |
| ap-southeast-1 | 0.857 |  |
| ap-southeast-2 | 0.725 |  |
| ap-southeast-3 | 0.886 |  |
| ap-southeast-4 | 0.773 |  |
| ap-southeast-5 | 0.854 |  |
| ap-southeast-6 | 0.768 |  |
| ap-southeast-7 | 0.935 |  |
| ca-central-1 | 0.165 | 18 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.435 |  |
| eu-central-2 | 0.454 |  |
| eu-north-1 | 0.494 |  |
| eu-south-1 | 0.467 |  |
| eu-south-2 | 0.477 |  |
| eu-west-1 | 0.363 |  |
| eu-west-2 | 0.400 |  |
| eu-west-3 | 0.421 |  |
| il-central-1 | 0.601 |  |
| me-central-1 | 0.834 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.544 |  |
| us-east-1 | 0.101 | 5089 |
| us-east-2 | 0.128 | 1685 |
| us-gov-east-1 | 0.139 | 1899 |
| us-gov-west-1 | 0.256 | 231 |
| us-west-1 | 0.199 | 4087 |
| us-west-2 | 0.256 | 192 |

