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
Updated: 2026-08-20T14:27:50.355610+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.006 |  |
| ap-east-1 | 0.671 |  |
| ap-east-2 | 0.605 |  |
| ap-northeast-1 | 0.490 |  |
| ap-northeast-2 | 0.596 |  |
| ap-northeast-3 | 0.515 |  |
| ap-south-1 | 0.928 |  |
| ap-south-2 | 0.939 |  |
| ap-southeast-1 | 0.745 |  |
| ap-southeast-2 | 0.645 |  |
| ap-southeast-3 | 0.806 |  |
| ap-southeast-4 | 0.691 |  |
| ap-southeast-5 | 0.768 |  |
| ap-southeast-6 | 0.676 |  |
| ap-southeast-7 | 0.852 |  |
| ca-central-1 | 0.244 | 18 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.467 |  |
| eu-central-2 | 0.554 |  |
| eu-north-1 | 0.585 |  |
| eu-south-1 | 0.559 |  |
| eu-south-2 | 0.552 |  |
| eu-west-1 | 0.452 |  |
| eu-west-2 | 0.476 |  |
| eu-west-3 | 0.492 |  |
| il-central-1 | 0.680 |  |
| me-central-1 | 0.904 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.204 |  |
| sa-east-1 | 0.633 |  |
| us-east-1 | 0.178 | 5027 |
| us-east-2 | 0.202 | 1680 |
| us-gov-east-1 | 0.164 | 1862 |
| us-gov-west-1 | 0.177 | 224 |
| us-west-1 | 0.115 | 4003 |
| us-west-2 | 0.178 | 184 |

