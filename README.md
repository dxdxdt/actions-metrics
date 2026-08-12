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
Updated: 2026-08-12T23:33:10.297628+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.875 |  |
| ap-east-1 | 0.814 |  |
| ap-east-2 | 0.749 |  |
| ap-northeast-1 | 0.627 |  |
| ap-northeast-2 | 0.739 |  |
| ap-northeast-3 | 0.659 |  |
| ap-south-1 | 0.816 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.889 |  |
| ap-southeast-2 | 0.805 |  |
| ap-southeast-3 | 0.940 |  |
| ap-southeast-4 | 0.845 |  |
| ap-southeast-5 | 0.905 |  |
| ap-southeast-6 | 0.840 |  |
| ap-southeast-7 | 0.996 |  |
| ca-central-1 | 0.113 | 18 |
| ca-west-1 | 0.278 |  |
| eu-central-1 | 0.392 |  |
| eu-central-2 | 0.419 |  |
| eu-north-1 | 0.444 |  |
| eu-south-1 | 0.418 |  |
| eu-south-2 | 0.431 |  |
| eu-west-1 | 0.314 |  |
| eu-west-2 | 0.352 |  |
| eu-west-3 | 0.377 |  |
| il-central-1 | 0.545 |  |
| me-central-1 | 0.757 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.494 |  |
| us-east-1 | 0.059 | 4984 |
| us-east-2 | 0.093 | 1679 |
| us-gov-east-1 | 0.104 | 1822 |
| us-gov-west-1 | 0.311 | 222 |
| us-west-1 | 0.267 | 3933 |
| us-west-2 | 0.313 | 176 |

