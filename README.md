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
Updated: 2026-07-13T21:48:20.020745+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.853 |  |
| ap-east-1 | 0.825 |  |
| ap-east-2 | 0.768 |  |
| ap-northeast-1 | 0.643 |  |
| ap-northeast-2 | 0.748 |  |
| ap-northeast-3 | 0.673 |  |
| ap-south-1 | 0.819 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.897 |  |
| ap-southeast-2 | 0.806 |  |
| ap-southeast-3 | 0.941 |  |
| ap-southeast-4 | 0.859 |  |
| ap-southeast-5 | 0.917 |  |
| ap-southeast-6 | 0.853 |  |
| ap-southeast-7 | 1.006 |  |
| ca-central-1 | 0.099 | 16 |
| ca-west-1 | 0.285 |  |
| eu-central-1 | 0.367 |  |
| eu-central-2 | 0.392 |  |
| eu-north-1 | 0.424 |  |
| eu-south-1 | 0.397 |  |
| eu-south-2 | 0.407 |  |
| eu-west-1 | 0.285 |  |
| eu-west-2 | 0.325 |  |
| eu-west-3 | 0.353 |  |
| il-central-1 | 0.524 |  |
| me-central-1 | 0.746 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.251 |  |
| sa-east-1 | 0.471 |  |
| us-east-1 | 0.037 | 4868 |
| us-east-2 | 0.066 | 1656 |
| us-gov-east-1 | 0.088 | 1743 |
| us-gov-west-1 | 0.332 | 202 |
| us-west-1 | 0.286 | 3773 |
| us-west-2 | 0.333 | 165 |

