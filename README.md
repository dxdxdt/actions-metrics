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
Updated: 2026-06-23T02:31:59.565997+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.990 |  |
| ap-east-1 | 0.720 |  |
| ap-east-2 | 0.659 |  |
| ap-northeast-1 | 0.550 |  |
| ap-northeast-2 | 0.643 |  |
| ap-northeast-3 | 0.568 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.904 |  |
| ap-southeast-1 | 0.797 |  |
| ap-southeast-2 | 0.681 |  |
| ap-southeast-3 | 0.849 |  |
| ap-southeast-4 | 0.726 |  |
| ap-southeast-5 | 0.814 |  |
| ap-southeast-6 | 0.714 |  |
| ap-southeast-7 | 0.900 |  |
| ca-central-1 | 0.191 | 16 |
| ca-west-1 | 0.216 |  |
| eu-central-1 | 0.503 |  |
| eu-central-2 | 0.531 |  |
| eu-north-1 | 0.551 |  |
| eu-south-1 | 0.541 |  |
| eu-south-2 | 0.538 |  |
| eu-west-1 | 0.425 |  |
| eu-west-2 | 0.460 |  |
| eu-west-3 | 0.483 |  |
| il-central-1 | 0.664 |  |
| me-central-1 | 0.875 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.612 |  |
| us-east-1 | 0.162 | 4785 |
| us-east-2 | 0.136 | 1638 |
| us-gov-east-1 | 0.137 | 1717 |
| us-gov-west-1 | 0.201 | 198 |
| us-west-1 | 0.145 | 3692 |
| us-west-2 | 0.206 | 163 |

