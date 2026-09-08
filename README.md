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
Updated: 2026-09-08T02:19:16.457821+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.010 |  |
| ap-east-1 | 0.695 |  |
| ap-east-2 | 0.633 |  |
| ap-northeast-1 | 0.515 |  |
| ap-northeast-2 | 0.620 |  |
| ap-northeast-3 | 0.543 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.792 |  |
| ap-southeast-2 | 0.655 |  |
| ap-southeast-3 | 0.826 |  |
| ap-southeast-4 | 0.698 |  |
| ap-southeast-5 | 0.793 |  |
| ap-southeast-6 | 0.702 |  |
| ap-southeast-7 | 0.875 |  |
| ca-central-1 | 0.254 | 18 |
| ca-west-1 | 0.198 |  |
| eu-central-1 | 0.516 |  |
| eu-central-2 | 0.538 |  |
| eu-north-1 | 0.589 |  |
| eu-south-1 | 0.550 |  |
| eu-south-2 | 0.584 |  |
| eu-west-1 | 0.451 |  |
| eu-west-2 | 0.484 |  |
| eu-west-3 | 0.498 |  |
| il-central-1 | 0.692 |  |
| me-central-1 | 0.918 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.624 |  |
| us-east-1 | 0.179 | 5091 |
| us-east-2 | 0.190 | 1685 |
| us-gov-east-1 | 0.178 | 1902 |
| us-gov-west-1 | 0.184 | 231 |
| us-west-1 | 0.125 | 4089 |
| us-west-2 | 0.183 | 192 |

