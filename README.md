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
Updated: 2026-06-17T14:55:20.091398+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.957 |  |
| ap-east-1 | 0.746 |  |
| ap-east-2 | 0.682 |  |
| ap-northeast-1 | 0.562 |  |
| ap-northeast-2 | 0.672 |  |
| ap-northeast-3 | 0.587 |  |
| ap-south-1 | 0.877 |  |
| ap-south-2 | 0.908 |  |
| ap-southeast-1 | 0.819 |  |
| ap-southeast-2 | 0.713 |  |
| ap-southeast-3 | 0.874 |  |
| ap-southeast-4 | 0.758 |  |
| ap-southeast-5 | 0.837 |  |
| ap-southeast-6 | 0.742 |  |
| ap-southeast-7 | 0.924 |  |
| ca-central-1 | 0.161 | 16 |
| ca-west-1 | 0.204 |  |
| eu-central-1 | 0.477 |  |
| eu-central-2 | 0.496 |  |
| eu-north-1 | 0.512 |  |
| eu-south-1 | 0.506 |  |
| eu-south-2 | 0.511 |  |
| eu-west-1 | 0.425 |  |
| eu-west-2 | 0.436 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.635 |  |
| me-central-1 | 0.879 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.578 |  |
| us-east-1 | 0.128 | 4765 |
| us-east-2 | 0.113 | 1635 |
| us-gov-east-1 | 0.120 | 1713 |
| us-gov-west-1 | 0.235 | 198 |
| us-west-1 | 0.175 | 3674 |
| us-west-2 | 0.233 | 163 |

