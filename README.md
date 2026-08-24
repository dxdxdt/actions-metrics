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
Updated: 2026-08-24T09:38:35.849960+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.029 |  |
| ap-east-1 | 0.677 |  |
| ap-east-2 | 0.619 |  |
| ap-northeast-1 | 0.499 |  |
| ap-northeast-2 | 0.591 |  |
| ap-northeast-3 | 0.525 |  |
| ap-south-1 | 0.917 |  |
| ap-south-2 | 0.929 |  |
| ap-southeast-1 | 0.761 |  |
| ap-southeast-2 | 0.653 |  |
| ap-southeast-3 | 0.813 |  |
| ap-southeast-4 | 0.698 |  |
| ap-southeast-5 | 0.776 |  |
| ap-southeast-6 | 0.675 |  |
| ap-southeast-7 | 0.859 |  |
| ca-central-1 | 0.245 | 18 |
| ca-west-1 | 0.185 |  |
| eu-central-1 | 0.539 |  |
| eu-central-2 | 0.553 |  |
| eu-north-1 | 0.593 |  |
| eu-south-1 | 0.566 |  |
| eu-south-2 | 0.591 |  |
| eu-west-1 | 0.474 |  |
| eu-west-2 | 0.496 |  |
| eu-west-3 | 0.520 |  |
| il-central-1 | 0.696 |  |
| me-central-1 | 0.923 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.681 |  |
| us-east-1 | 0.208 | 5051 |
| us-east-2 | 0.213 | 1682 |
| us-gov-east-1 | 0.204 | 1878 |
| us-gov-west-1 | 0.146 | 226 |
| us-west-1 | 0.141 | 4044 |
| us-west-2 | 0.144 | 186 |

