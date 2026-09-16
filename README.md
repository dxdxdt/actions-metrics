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
Updated: 2026-09-16T23:27:43.138603+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.017 |  |
| ap-east-1 | 0.663 |  |
| ap-east-2 | 0.603 |  |
| ap-northeast-1 | 0.480 |  |
| ap-northeast-2 | 0.589 |  |
| ap-northeast-3 | 0.509 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.860 |  |
| ap-southeast-1 | 0.762 |  |
| ap-southeast-2 | 0.660 |  |
| ap-southeast-3 | 0.795 |  |
| ap-southeast-4 | 0.705 |  |
| ap-southeast-5 | 0.758 |  |
| ap-southeast-6 | 0.689 |  |
| ap-southeast-7 | 0.845 |  |
| ca-central-1 | 0.237 | 18 |
| ca-west-1 | 0.194 |  |
| eu-central-1 | 0.520 |  |
| eu-central-2 | 0.539 |  |
| eu-north-1 | 0.582 |  |
| eu-south-1 | 0.542 |  |
| eu-south-2 | 0.565 |  |
| eu-west-1 | 0.457 |  |
| eu-west-2 | 0.495 |  |
| eu-west-3 | 0.507 |  |
| il-central-1 | 0.691 |  |
| me-central-1 | 0.917 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.254 |  |
| sa-east-1 | 0.649 |  |
| us-east-1 | 0.199 | 5103 |
| us-east-2 | 0.197 | 1686 |
| us-gov-east-1 | 0.213 | 1914 |
| us-gov-west-1 | 0.153 | 234 |
| us-west-1 | 0.149 | 4118 |
| us-west-2 | 0.154 | 192 |

