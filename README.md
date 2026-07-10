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
Updated: 2026-07-10T06:36:03.046920+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.040 |  |
| ap-east-1 | 0.656 |  |
| ap-east-2 | 0.593 |  |
| ap-northeast-1 | 0.473 |  |
| ap-northeast-2 | 0.595 |  |
| ap-northeast-3 | 0.500 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.856 |  |
| ap-southeast-1 | 0.728 |  |
| ap-southeast-2 | 0.652 |  |
| ap-southeast-3 | 0.775 |  |
| ap-southeast-4 | 0.695 |  |
| ap-southeast-5 | 0.746 |  |
| ap-southeast-6 | 0.678 |  |
| ap-southeast-7 | 0.837 |  |
| ca-central-1 | 0.280 | 16 |
| ca-west-1 | 0.233 |  |
| eu-central-1 | 0.553 |  |
| eu-central-2 | 0.592 |  |
| eu-north-1 | 0.618 |  |
| eu-south-1 | 0.596 |  |
| eu-south-2 | 0.588 |  |
| eu-west-1 | 0.480 |  |
| eu-west-2 | 0.516 |  |
| eu-west-3 | 0.534 |  |
| il-central-1 | 0.716 |  |
| me-central-1 | 0.959 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.661 |  |
| us-east-1 | 0.217 | 4842 |
| us-east-2 | 0.227 | 1656 |
| us-gov-east-1 | 0.207 | 1733 |
| us-gov-west-1 | 0.146 | 202 |
| us-west-1 | 0.134 | 3761 |
| us-west-2 | 0.147 | 164 |

