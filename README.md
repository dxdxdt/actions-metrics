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
Updated: 2026-08-05T19:17:54.380421+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.932 |  |
| ap-east-1 | 0.806 |  |
| ap-east-2 | 0.744 |  |
| ap-northeast-1 | 0.627 |  |
| ap-northeast-2 | 0.728 |  |
| ap-northeast-3 | 0.653 |  |
| ap-south-1 | 0.840 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.881 |  |
| ap-southeast-2 | 0.780 |  |
| ap-southeast-3 | 0.927 |  |
| ap-southeast-4 | 0.825 |  |
| ap-southeast-5 | 0.897 |  |
| ap-southeast-6 | 0.818 |  |
| ap-southeast-7 | 0.983 |  |
| ca-central-1 | 0.103 | 17 |
| ca-west-1 | 0.276 |  |
| eu-central-1 | 0.400 |  |
| eu-central-2 | 0.414 |  |
| eu-north-1 | 0.459 |  |
| eu-south-1 | 0.411 |  |
| eu-south-2 | 0.431 |  |
| eu-west-1 | 0.310 |  |
| eu-west-2 | 0.344 |  |
| eu-west-3 | 0.376 |  |
| il-central-1 | 0.548 |  |
| me-central-1 | 0.762 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.497 |  |
| us-east-1 | 0.056 | 4944 |
| us-east-2 | 0.077 | 1674 |
| us-gov-east-1 | 0.084 | 1803 |
| us-gov-west-1 | 0.310 | 211 |
| us-west-1 | 0.254 | 3886 |
| us-west-2 | 0.310 | 172 |

