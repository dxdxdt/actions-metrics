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
Updated: 2026-02-22T05:45:50.379982+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.940 |  |
| ap-east-1 | 0.762 |  |
| ap-east-2 | 0.690 |  |
| ap-northeast-1 | 0.581 |  |
| ap-northeast-2 | 0.688 |  |
| ap-northeast-3 | 0.607 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.952 |  |
| ap-southeast-1 | 0.824 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.882 |  |
| ap-southeast-4 | 0.782 |  |
| ap-southeast-5 | 0.852 |  |
| ap-southeast-6 | 0.841 |  |
| ap-southeast-7 | 0.927 |  |
| ca-central-1 | 0.102 | 16 |
| ca-west-1 | 0.201 |  |
| eu-central-1 | 0.444 |  |
| eu-central-2 | 0.457 |  |
| eu-north-1 | 0.493 |  |
| eu-south-1 | 0.475 |  |
| eu-south-2 | 0.481 |  |
| eu-west-1 | 0.375 |  |
| eu-west-2 | 0.398 |  |
| eu-west-3 | 0.429 |  |
| il-central-1 | 0.637 |  |
| me-central-1 | 0.829 |  |
| me-south-1 | 0.782 |  |
| mx-central-1 | 0.213 |  |
| sa-east-1 | 0.557 |  |
| us-east-1 | 0.089 | 4159 |
| us-east-2 | 0.067 | 1368 |
| us-gov-east-1 | 0.068 | 1499 |
| us-gov-west-1 | 0.225 | 160 |
| us-west-1 | 0.246 | 3095 |
| us-west-2 | 0.223 | 129 |

