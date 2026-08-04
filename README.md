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
Updated: 2026-08-04T21:03:26.469826+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.008 |  |
| ap-east-1 | 0.677 |  |
| ap-east-2 | 0.617 |  |
| ap-northeast-1 | 0.501 |  |
| ap-northeast-2 | 0.609 |  |
| ap-northeast-3 | 0.527 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.754 |  |
| ap-southeast-2 | 0.680 |  |
| ap-southeast-3 | 0.806 |  |
| ap-southeast-4 | 0.726 |  |
| ap-southeast-5 | 0.774 |  |
| ap-southeast-6 | 0.707 |  |
| ap-southeast-7 | 0.859 |  |
| ca-central-1 | 0.224 | 17 |
| ca-west-1 | 0.183 |  |
| eu-central-1 | 0.515 |  |
| eu-central-2 | 0.538 |  |
| eu-north-1 | 0.548 |  |
| eu-south-1 | 0.543 |  |
| eu-south-2 | 0.556 |  |
| eu-west-1 | 0.471 |  |
| eu-west-2 | 0.473 |  |
| eu-west-3 | 0.498 |  |
| il-central-1 | 0.680 |  |
| me-central-1 | 0.913 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.254 |  |
| sa-east-1 | 0.637 |  |
| us-east-1 | 0.188 | 4939 |
| us-east-2 | 0.188 | 1674 |
| us-gov-east-1 | 0.168 | 1801 |
| us-gov-west-1 | 0.170 | 211 |
| us-west-1 | 0.166 | 3883 |
| us-west-2 | 0.168 | 172 |

