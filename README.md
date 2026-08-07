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
Updated: 2026-08-07T19:45:56.420258+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.875 |  |
| ap-east-1 | 0.806 |  |
| ap-east-2 | 0.740 |  |
| ap-northeast-1 | 0.617 |  |
| ap-northeast-2 | 0.730 |  |
| ap-northeast-3 | 0.653 |  |
| ap-south-1 | 0.826 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.878 |  |
| ap-southeast-2 | 0.795 |  |
| ap-southeast-3 | 0.931 |  |
| ap-southeast-4 | 0.837 |  |
| ap-southeast-5 | 0.896 |  |
| ap-southeast-6 | 0.849 |  |
| ap-southeast-7 | 0.978 |  |
| ca-central-1 | 0.111 | 18 |
| ca-west-1 | 0.277 |  |
| eu-central-1 | 0.385 |  |
| eu-central-2 | 0.405 |  |
| eu-north-1 | 0.429 |  |
| eu-south-1 | 0.404 |  |
| eu-south-2 | 0.420 |  |
| eu-west-1 | 0.304 |  |
| eu-west-2 | 0.339 |  |
| eu-west-3 | 0.360 |  |
| il-central-1 | 0.544 |  |
| me-central-1 | 0.762 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.488 |  |
| us-east-1 | 0.053 | 4952 |
| us-east-2 | 0.084 | 1675 |
| us-gov-east-1 | 0.092 | 1808 |
| us-gov-west-1 | 0.313 | 211 |
| us-west-1 | 0.274 | 3895 |
| us-west-2 | 0.317 | 172 |

