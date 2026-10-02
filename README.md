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
Updated: 2026-10-02T21:07:17.990977+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.996 |  |
| ap-east-1 | 0.673 |  |
| ap-east-2 | 0.611 |  |
| ap-northeast-1 | 0.496 |  |
| ap-northeast-2 | 0.579 |  |
| ap-northeast-3 | 0.522 |  |
| ap-south-1 | 0.927 |  |
| ap-south-2 | 0.981 |  |
| ap-southeast-1 | 0.776 |  |
| ap-southeast-2 | 0.651 |  |
| ap-southeast-3 | 0.806 |  |
| ap-southeast-4 | 0.702 |  |
| ap-southeast-5 | 0.769 |  |
| ap-southeast-6 | 0.710 |  |
| ap-southeast-7 | 0.858 |  |
| ca-central-1 | 0.212 | 18 |
| ca-west-1 | 0.248 |  |
| eu-central-1 | 0.516 |  |
| eu-central-2 | 0.532 |  |
| eu-north-1 | 0.555 |  |
| eu-south-1 | 0.534 |  |
| eu-south-2 | 0.528 |  |
| eu-west-1 | 0.436 |  |
| eu-west-2 | 0.459 |  |
| eu-west-3 | 0.500 |  |
| il-central-1 | 0.668 |  |
| me-central-1 | 0.879 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.189 |  |
| sa-east-1 | 0.638 |  |
| us-east-1 | 0.181 | 5133 |
| us-east-2 | 0.172 | 1689 |
| us-gov-east-1 | 0.178 | 1932 |
| us-gov-west-1 | 0.177 | 236 |
| us-west-1 | 0.116 | 4152 |
| us-west-2 | 0.176 | 192 |

