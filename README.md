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
Updated: 2026-08-26T06:34:06.005552+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.889 |  |
| ap-east-1 | 0.783 |  |
| ap-east-2 | 0.722 |  |
| ap-northeast-1 | 0.601 |  |
| ap-northeast-2 | 0.706 |  |
| ap-northeast-3 | 0.627 |  |
| ap-south-1 | 0.838 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.866 |  |
| ap-southeast-2 | 0.760 |  |
| ap-southeast-3 | 0.911 |  |
| ap-southeast-4 | 0.817 |  |
| ap-southeast-5 | 0.885 |  |
| ap-southeast-6 | 0.787 |  |
| ap-southeast-7 | 0.958 |  |
| ca-central-1 | 0.139 | 18 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.408 |  |
| eu-central-2 | 0.438 |  |
| eu-north-1 | 0.466 |  |
| eu-south-1 | 0.440 |  |
| eu-south-2 | 0.443 |  |
| eu-west-1 | 0.335 |  |
| eu-west-2 | 0.368 |  |
| eu-west-3 | 0.390 |  |
| il-central-1 | 0.566 |  |
| me-central-1 | 0.784 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.514 |  |
| us-east-1 | 0.076 | 5069 |
| us-east-2 | 0.101 | 1684 |
| us-gov-east-1 | 0.119 | 1885 |
| us-gov-west-1 | 0.285 | 228 |
| us-west-1 | 0.224 | 4056 |
| us-west-2 | 0.286 | 188 |

