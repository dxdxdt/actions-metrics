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
Updated: 2026-08-02T21:47:03.083222+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.996 |  |
| ap-east-1 | 0.686 |  |
| ap-east-2 | 0.627 |  |
| ap-northeast-1 | 0.511 |  |
| ap-northeast-2 | 0.615 |  |
| ap-northeast-3 | 0.538 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.762 |  |
| ap-southeast-2 | 0.643 |  |
| ap-southeast-3 | 0.821 |  |
| ap-southeast-4 | 0.685 |  |
| ap-southeast-5 | 0.780 |  |
| ap-southeast-6 | 0.701 |  |
| ap-southeast-7 | 0.865 |  |
| ca-central-1 | 0.227 | 17 |
| ca-west-1 | 0.207 |  |
| eu-central-1 | 0.518 |  |
| eu-central-2 | 0.542 |  |
| eu-north-1 | 0.563 |  |
| eu-south-1 | 0.545 |  |
| eu-south-2 | 0.555 |  |
| eu-west-1 | 0.438 |  |
| eu-west-2 | 0.479 |  |
| eu-west-3 | 0.496 |  |
| il-central-1 | 0.677 |  |
| me-central-1 | 0.887 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.635 |  |
| us-east-1 | 0.190 | 4933 |
| us-east-2 | 0.188 | 1673 |
| us-gov-east-1 | 0.172 | 1798 |
| us-gov-west-1 | 0.173 | 209 |
| us-west-1 | 0.114 | 3875 |
| us-west-2 | 0.173 | 172 |

