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
Updated: 2026-07-05T21:54:37.488984+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.875 |  |
| ap-east-1 | 0.810 |  |
| ap-east-2 | 0.752 |  |
| ap-northeast-1 | 0.633 |  |
| ap-northeast-2 | 0.735 |  |
| ap-northeast-3 | 0.659 |  |
| ap-south-1 | 0.814 |  |
| ap-south-2 | 0.867 |  |
| ap-southeast-1 | 0.886 |  |
| ap-southeast-2 | 0.785 |  |
| ap-southeast-3 | 0.939 |  |
| ap-southeast-4 | 0.843 |  |
| ap-southeast-5 | 0.906 |  |
| ap-southeast-6 | 0.827 |  |
| ap-southeast-7 | 0.992 |  |
| ca-central-1 | 0.117 | 16 |
| ca-west-1 | 0.276 |  |
| eu-central-1 | 0.391 |  |
| eu-central-2 | 0.417 |  |
| eu-north-1 | 0.448 |  |
| eu-south-1 | 0.422 |  |
| eu-south-2 | 0.427 |  |
| eu-west-1 | 0.309 |  |
| eu-west-2 | 0.347 |  |
| eu-west-3 | 0.373 |  |
| il-central-1 | 0.588 |  |
| me-central-1 | 0.748 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.486 |  |
| us-east-1 | 0.056 | 4826 |
| us-east-2 | 0.100 | 1652 |
| us-gov-east-1 | 0.102 | 1729 |
| us-gov-west-1 | 0.309 | 200 |
| us-west-1 | 0.261 | 3747 |
| us-west-2 | 0.309 | 164 |

