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
Updated: 2026-08-06T23:51:49.385405+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.873 |  |
| ap-east-1 | 0.807 |  |
| ap-east-2 | 0.743 |  |
| ap-northeast-1 | 0.622 |  |
| ap-northeast-2 | 0.744 |  |
| ap-northeast-3 | 0.653 |  |
| ap-south-1 | 0.831 |  |
| ap-south-2 | 0.915 |  |
| ap-southeast-1 | 0.883 |  |
| ap-southeast-2 | 0.784 |  |
| ap-southeast-3 | 0.936 |  |
| ap-southeast-4 | 0.825 |  |
| ap-southeast-5 | 0.914 |  |
| ap-southeast-6 | 0.829 |  |
| ap-southeast-7 | 0.994 |  |
| ca-central-1 | 0.120 | 18 |
| ca-west-1 | 0.253 |  |
| eu-central-1 | 0.392 |  |
| eu-central-2 | 0.417 |  |
| eu-north-1 | 0.442 |  |
| eu-south-1 | 0.418 |  |
| eu-south-2 | 0.427 |  |
| eu-west-1 | 0.317 |  |
| eu-west-2 | 0.353 |  |
| eu-west-3 | 0.373 |  |
| il-central-1 | 0.552 |  |
| me-central-1 | 0.795 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.502 |  |
| us-east-1 | 0.072 | 4948 |
| us-east-2 | 0.096 | 1674 |
| us-gov-east-1 | 0.108 | 1805 |
| us-gov-west-1 | 0.314 | 211 |
| us-west-1 | 0.253 | 3889 |
| us-west-2 | 0.302 | 172 |

