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
Updated: 2026-05-27T23:56:13.691859+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.014 |  |
| ap-east-1 | 0.685 |  |
| ap-east-2 | 0.627 |  |
| ap-northeast-1 | 0.507 |  |
| ap-northeast-2 | 0.613 |  |
| ap-northeast-3 | 0.540 |  |
| ap-south-1 | 0.913 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.762 |  |
| ap-southeast-2 | 0.662 |  |
| ap-southeast-3 | 0.814 |  |
| ap-southeast-4 | 0.703 |  |
| ap-southeast-5 | 0.776 |  |
| ap-southeast-6 | 0.690 |  |
| ap-southeast-7 | 0.866 |  |
| ca-central-1 | 0.229 | 16 |
| ca-west-1 | 0.318 |  |
| eu-central-1 | 0.518 |  |
| eu-central-2 | 0.538 |  |
| eu-north-1 | 0.567 |  |
| eu-south-1 | 0.548 |  |
| eu-south-2 | 0.569 |  |
| eu-west-1 | 0.436 |  |
| eu-west-2 | 0.493 |  |
| eu-west-3 | 0.506 |  |
| il-central-1 | 0.680 |  |
| me-central-1 | 0.909 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.218 |  |
| sa-east-1 | 0.643 |  |
| us-east-1 | 0.190 | 4692 |
| us-east-2 | 0.150 | 1612 |
| us-gov-east-1 | 0.162 | 1706 |
| us-gov-west-1 | 0.177 | 195 |
| us-west-1 | 0.123 | 3612 |
| us-west-2 | 0.178 | 161 |

