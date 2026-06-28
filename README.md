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
Updated: 2026-06-28T12:18:53.558464+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.927 |  |
| ap-east-1 | 0.762 |  |
| ap-east-2 | 0.702 |  |
| ap-northeast-1 | 0.586 |  |
| ap-northeast-2 | 0.691 |  |
| ap-northeast-3 | 0.609 |  |
| ap-south-1 | 0.838 |  |
| ap-south-2 | 0.852 |  |
| ap-southeast-1 | 0.837 |  |
| ap-southeast-2 | 0.724 |  |
| ap-southeast-3 | 0.883 |  |
| ap-southeast-4 | 0.771 |  |
| ap-southeast-5 | 0.855 |  |
| ap-southeast-6 | 0.763 |  |
| ap-southeast-7 | 0.939 |  |
| ca-central-1 | 0.154 | 16 |
| ca-west-1 | 0.253 |  |
| eu-central-1 | 0.449 |  |
| eu-central-2 | 0.475 |  |
| eu-north-1 | 0.503 |  |
| eu-south-1 | 0.477 |  |
| eu-south-2 | 0.480 |  |
| eu-west-1 | 0.366 |  |
| eu-west-2 | 0.400 |  |
| eu-west-3 | 0.427 |  |
| il-central-1 | 0.610 |  |
| me-central-1 | 0.839 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.547 |  |
| us-east-1 | 0.112 | 4798 |
| us-east-2 | 0.121 | 1644 |
| us-gov-east-1 | 0.133 | 1723 |
| us-gov-west-1 | 0.249 | 199 |
| us-west-1 | 0.196 | 3715 |
| us-west-2 | 0.247 | 163 |

