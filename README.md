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
Updated: 2026-09-23T18:06:28.759810+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.929 |  |
| ap-east-1 | 0.792 |  |
| ap-east-2 | 0.725 |  |
| ap-northeast-1 | 0.609 |  |
| ap-northeast-2 | 0.701 |  |
| ap-northeast-3 | 0.635 |  |
| ap-south-1 | 0.870 |  |
| ap-south-2 | 0.924 |  |
| ap-southeast-1 | 0.928 |  |
| ap-southeast-2 | 0.762 |  |
| ap-southeast-3 | 0.948 |  |
| ap-southeast-4 | 0.810 |  |
| ap-southeast-5 | 0.918 |  |
| ap-southeast-6 | 0.818 |  |
| ap-southeast-7 | 1.000 |  |
| ca-central-1 | 0.150 | 18 |
| ca-west-1 | 0.288 |  |
| eu-central-1 | 0.435 |  |
| eu-central-2 | 0.452 |  |
| eu-north-1 | 0.490 |  |
| eu-south-1 | 0.462 |  |
| eu-south-2 | 0.472 |  |
| eu-west-1 | 0.358 |  |
| eu-west-2 | 0.391 |  |
| eu-west-3 | 0.415 |  |
| il-central-1 | 0.593 |  |
| me-central-1 | 0.808 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.545 |  |
| us-east-1 | 0.099 | 5116 |
| us-east-2 | 0.124 | 1686 |
| us-gov-east-1 | 0.134 | 1924 |
| us-gov-west-1 | 0.304 | 235 |
| us-west-1 | 0.237 | 4135 |
| us-west-2 | 0.306 | 192 |

