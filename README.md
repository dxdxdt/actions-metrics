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
Updated: 2026-11-12T09:01:32.666170+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.683 |  |
| ap-east-1 | 0.585 |  |
| ap-east-2 | 0.540 |  |
| ap-northeast-1 | 0.444 |  |
| ap-northeast-2 | 0.520 |  |
| ap-northeast-3 | 0.464 |  |
| ap-south-1 | 0.643 |  |
| ap-south-2 | 0.731 |  |
| ap-southeast-1 | 0.645 |  |
| ap-southeast-2 | 0.558 |  |
| ap-southeast-3 | 0.679 |  |
| ap-southeast-4 | 0.625 |  |
| ap-southeast-5 | 0.657 |  |
| ap-southeast-6 | 0.579 |  |
| ap-southeast-7 | 0.714 |  |
| ca-central-1 | 0.099 | 18 |
| ca-west-1 | 0.166 |  |
| eu-central-1 | 0.316 |  |
| eu-central-2 | 0.333 |  |
| eu-north-1 | 0.358 |  |
| eu-south-1 | 0.335 |  |
| eu-south-2 | 0.324 |  |
| eu-west-1 | 0.263 |  |
| eu-west-2 | 0.289 |  |
| eu-west-3 | 0.305 |  |
| il-central-1 | 0.441 |  |
| me-central-1 | 0.591 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.530 |  |
| mx-central-1 | 0.163 |  |
| sa-east-1 | 0.389 |  |
| us-east-1 | 0.061 | 5180 |
| us-east-2 | 0.078 | 1727 |
| us-gov-east-1 | 0.089 | 1959 |
| us-gov-west-1 | 0.211 | 245 |
| us-west-1 | 0.163 | 4216 |
| us-west-2 | 0.211 | 197 |

