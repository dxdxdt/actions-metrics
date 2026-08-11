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
Updated: 2026-08-11T01:05:31.935547+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.899 |  |
| ap-east-1 | 0.786 |  |
| ap-east-2 | 0.729 |  |
| ap-northeast-1 | 0.609 |  |
| ap-northeast-2 | 0.714 |  |
| ap-northeast-3 | 0.636 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.951 |  |
| ap-southeast-1 | 0.864 |  |
| ap-southeast-2 | 0.772 |  |
| ap-southeast-3 | 0.918 |  |
| ap-southeast-4 | 0.811 |  |
| ap-southeast-5 | 0.883 |  |
| ap-southeast-6 | 0.807 |  |
| ap-southeast-7 | 0.966 |  |
| ca-central-1 | 0.110 | 18 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.419 |  |
| eu-central-2 | 0.445 |  |
| eu-north-1 | 0.462 |  |
| eu-south-1 | 0.443 |  |
| eu-south-2 | 0.449 |  |
| eu-west-1 | 0.341 |  |
| eu-west-2 | 0.372 |  |
| eu-west-3 | 0.394 |  |
| il-central-1 | 0.597 |  |
| me-central-1 | 0.815 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.519 |  |
| us-east-1 | 0.073 | 4974 |
| us-east-2 | 0.091 | 1678 |
| us-gov-east-1 | 0.085 | 1818 |
| us-gov-west-1 | 0.289 | 216 |
| us-west-1 | 0.234 | 3918 |
| us-west-2 | 0.285 | 176 |

