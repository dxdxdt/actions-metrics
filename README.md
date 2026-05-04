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
Updated: 2026-05-04T08:22:23.073054+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.007 |  |
| ap-east-1 | 0.675 |  |
| ap-east-2 | 0.611 |  |
| ap-northeast-1 | 0.500 |  |
| ap-northeast-2 | 0.599 |  |
| ap-northeast-3 | 0.521 |  |
| ap-south-1 | 0.922 |  |
| ap-south-2 | 0.922 |  |
| ap-southeast-1 | 0.756 |  |
| ap-southeast-2 | 0.720 |  |
| ap-southeast-3 | 0.809 |  |
| ap-southeast-4 | 0.769 |  |
| ap-southeast-5 | 0.776 |  |
| ap-southeast-6 | 0.702 |  |
| ap-southeast-7 | 0.863 |  |
| ca-central-1 | 0.226 | 16 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.544 |  |
| eu-central-2 | 0.544 |  |
| eu-north-1 | 0.578 |  |
| eu-south-1 | 0.541 |  |
| eu-south-2 | 0.557 |  |
| eu-west-1 | 0.462 |  |
| eu-west-2 | 0.490 |  |
| eu-west-3 | 0.499 |  |
| il-central-1 | 0.692 |  |
| me-central-1 | 0.895 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.202 |  |
| sa-east-1 | 0.633 |  |
| us-east-1 | 0.190 | 4591 |
| us-east-2 | 0.172 | 1565 |
| us-gov-east-1 | 0.159 | 1672 |
| us-gov-west-1 | 0.176 | 194 |
| us-west-1 | 0.120 | 3530 |
| us-west-2 | 0.178 | 157 |

